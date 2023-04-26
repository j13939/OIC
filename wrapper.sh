set -x


setOutput()
{
    if [ $# -ne 2 ]
    then
        echo "Key and value required on setOutput function call"
        exit 1
    fi
    echo ${2} > "/u01/flexdeploy/application/localhost/work/48598678/4427396/internal/outputs/${1}"
}


ignoreStatus()
{
    setOutput FILE_PROCESSING_STATUS ENDPOINT_SKIPPED
}

setObjectResultStatusSuccess()
{
    setOutput FILE_PROCESSING_STATUS SUCCESS
}

setObjectResultStatusFailed()
{
    setOutput FILE_PROCESSING_STATUS FAILED
}

setObjectResultStatusSkipped()
{
    setOutput FILE_PROCESSING_STATUS SKIPPED
}

setObjectResultStatusNotAttempted()
{
    setOutput FILE_PROCESSING_STATUS NOT_ATTEMPTED
}

setObjectResultStatusIgnore()
{
    setOutput FILE_PROCESSING_STATUS ENDPOINT_SKIPPED
}


cd ${FD_TEMP_DIR}

for INTEGRATION in `ls */*.iar`
do
INTEGRATION_IAR=`basename ${INTEGRATION}`

if [ -f integrations/${INTEGRATION_IAR} ]
then
rm integrations/${INTEGRATION_IAR}
fi
cp  ${INTEGRATION} integrations/${INTEGRATION_IAR}
done
