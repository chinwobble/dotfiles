docker run -it --rm -e USERNAME=%USERNAME% -v %USERPROFILE%/.azure:/root/.azure -v %USERPROFILE%/.kube:/root/.kube -v %CD%:/var/app -w /var/app mcr.microsoft.com/azure-cli:latest
