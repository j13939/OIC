set -x


setOutput()
{
    if [ $# -ne 2 ]
    then
        echo "Key and value required on setOutput function call"
        exit 1
    fi
    echo ${2} > "/u01/flexdeploy/application/localhost/work/48598678/4427038/internal/outputs/${1}"
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


cp  $FD_TEMP_DIR/*/*.iar $FD_TEMP_DIR/integrations
