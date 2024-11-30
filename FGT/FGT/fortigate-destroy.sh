#!/bin/sh

PROJECT_ID='gcp-prj-inf-automation-prd-01'
SA="svc-cloudautomation@gcp-prj-inf-automation-prd-01.iam.gserviceaccount.com"
TFVARS_FILE_1='../input-file/disk.tfvars'
TFVARS_FILE_2='../input-file/vm.tfvars'
TFVARS_FILE_3='../input-file/umig.tfvars'
TFVARS_FILE_4='../input-file/health_check.tfvars'
TFVARS_FILE_5='../input-file/nlb.tfvars'
TFVARS_FILE_6='../input-file/router.tfvars'
TFVARS_FILE_7='../input-file/nat.tfvars'
TFVARS_FILE_8='../input-file/address.tfvars'
TFVARS_FILE_9='../input-file/data.tfvars'
TFVARS_FILE_10='../input-file/secret.tfvars'

TF_GCS_MAIN_FOLDER='Foundation'
TF_HANDLER='fortigate'
TF_FILES_LOCATION='template'
TF_GCS='gcp-yyz-prd-inf-cloudautomation-sbuc-01'
TF_STATE_FOLDER='state-file'
TF_OUTPUT_FOLDER='output-file'
TF_LOG_FOLDER='log-file'
TF_DESTROY_LOG_FOLDER='destroy'
TF_LOG='INFO'

echo -e "\n"
echo "*************** Switching to TF Files Location ******************"

cd ${TF_FILES_LOCATION}/
echo -e "${TF_FILES_LOCATION}/"

echo -e "\n"
echo "*************** Setting up default project **********************"

echo -e "$PROJECT_ID"
gcloud config set project $PROJECT_ID

echo -e "----------------------------------------------------------------------------------------------------------"
echo -e "----------------------------------------------------------------------------------------------------------"
echo -e "\n"

echo "*************** Generating Oauth Access Token *******************"

export MYTOKEN=$(gcloud auth print-access-token --impersonate-service-account=$SA)

echo -e "\n"

echo "************************ Terraform Init *************************"

export TF_LOG=${TF_LOG}
export TF_LOG_PATH=../${TF_LOG_FOLDER}/${TF_DESTROY_LOG_FOLDER}/${TF_HANDLER}-$(date +"%d-%m-%Y_%H:%M").log

terraform init -upgrade -backend-config=bucket=${TF_GCS} -backend-config=prefix="${TF_GCS_MAIN_FOLDER}/${TF_HANDLER}/${TF_STATE_FOLDER}"
echo -e "----------------------------------------------------------------------------------------------------------"
echo -e "----------------------------------------------------------------------------------------------------------"
echo -e "\n"

echo "********************* Terraform Destroy *************************"

echo -e "Terraform Destroy is going to start, Please wait......!!!!"
echo -e "\n"
read -p "Your infrastructure is getting destroyed. Are you Sure ? y or n: " ans
echo -e "Answer: $ans"
if [ $ans == "y" ]
then
    terraform destroy \
    -var="access_token=$MYTOKEN" \
    -var="project_id=${PROJECT_ID}" \
    -var-file=${TFVARS_FILE_1} \
    -var-file=${TFVARS_FILE_2} \
    -var-file=${TFVARS_FILE_3} \
    -var-file=${TFVARS_FILE_4} \
    -var-file=${TFVARS_FILE_5} \
    -var-file=${TFVARS_FILE_6} \
    -var-file=${TFVARS_FILE_7} \
    -var-file=${TFVARS_FILE_8} \
    -var-file=${TFVARS_FILE_9} \
    -var-file=${TFVARS_FILE_10}

    echo "*************** Saving terraform log file to gcs ****************"
    echo -e "\n"

    gsutil cp ../${TF_LOG_FOLDER}/${TF_DESTROY_LOG_FOLDER}/*.log gs://${TF_GCS}/${TF_GCS_MAIN_FOLDER}/${TF_HANDLER}/${TF_LOG_FOLDER}/${TF_DESTROY_LOG_FOLDER}/
else
    echo -e "Answer is 'n', Hence, exiting."
fi

echo -e "----------------------------------------------------------------------------------------------------------"
echo -e "----------------------------------------------------------------------------------------------------------"
echo -e "\n"