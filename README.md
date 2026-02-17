#### About this repo: ####
This repository contains basic terraform configurations for provisioning a new GCP project.<br>
Can be used as a template for provisioning a project with few variable changes.

1: Clone this repo<br>
```
git clone https://github.com/ramantandon/gcp-project-01.git
```

2: Create new repository<br>
&emsp;Create a git repo for the new project and clone it to GitHub using gh cli.
```
gh repo create <gcp-project-02> --public -c && cd <gcp-project-02>
```

3: Copy files<br>
&emsp;Copy *.tf and *.tbd from gcp-project-01 to the new project repo gcp-project-02.

3: Open VSCode<br> 
&emsp;Click on backend.tf and update terraform workspace name (yet to be created in app.terraform.io).<br>
&emsp;Backend is required for executing `terraform plan` locally for verifying code, syntax, and <br> 
&emsp;view plan output before committing and pushing code.
```
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "ramantandon"
    workspaces {
      name = "<gcp-project-02>"
    }
  }
}
```

4: Execute `terraform login` <br>
&emsp;Execute `terraform login` which will store token for TFC under `~/.terraform.d/credentials.tfrc.json`  
```
$ terraform login
Terraform will request an API token for app.terraform.io using your browser.
If login is successful, Terraform will store the token in plain text in
the following file for use by subsequent commands:
    /root/.terraform.d/credentials.tfrc.json
```

5: Execute `terraform plan` <br> 
&emsp;`terraform plan` will download required provider versions and create `terraform.tfstate` <br>
&emsp;under `.terraform` directory.<br>
&emsp;It will also create dependency lock file `.terraform.lock.hcl`<br>
&emsp;Would suggest to include and commit these dot files, so we have uniformity in provider versions <br>
&emsp;and dependency lock.

6: Update `Variables` <br>
&emsp;Update **project name**, **billing account id** in `variables.tf` <br>
&emsp;Verify other terraform configs **main.tf**, **network.tf**, **versions.tf**, **providers.tf**

7: Git commit<br>
&emsp;execute `git add`, `git commit`, `git push` to add and push code to remote repository.

8: Create Terraform Workspace <br>
&emsp;Terraform Cloud Workflow creation steps. <br>
  - Login to [Terraform Cloud](https://app.terraform.io/)
  - Click New Workspace
  - Choose Version Control Workflow
  - Connect to version control provider (ex: GitHub App, BitBucket Cloud)
  - Filter and select your repository
  - Verify or update Workspace Name
  - Click Advanced Options, and type in VCS branch, as applicable.
  - Create Workspace
  - Click on Variables tab, and add an Environment Variable
  - Key would be `GOOGLE_CREDENTIALS` and value would be `application_default_credentials.json` 
  - Note: `GOOGLE_CREDENTIALS` value can be either `application_default_credentials.json` created by running 
    `gcloud    auth application-default login` or it can be private key of a Service Account, but if you are not having a GCP  Organisation and only creating non-org projects then you cannot create a project using terraform's `google_project` resource using a service account key. In that case, it needs to be user account.
  - Note: You simply **CANNOT** copy/paste keys to Terraform's environment variable as there are newline characters added. To remove newline characters, we can use vscode. Copy key in vscode, select the key, ctrl + shift + p, Join Lines => enter. Copy the resultant key and paste it in TFC.

9: Execute plan/apply <br>
&emsp;Execute first plan/apply manually at console. Subsequent code changes will automatically trigger terraform plan.<br>
&emsp;You can go to Settings in Terraform console to auto apply, as required.

#### Nice commands to know ####
- `terraform validate`  - validates the syntax and arguments of Terraform configuration files
- `terraform fmt`       - rewrites Terraform configuration files to a canonical format and style
- `terraform providers` - shows information about the provider requirements of the configutaion in the current working directory
- `terraform console`   - provides and interactive command-line console for evaluating and experimenting with expressions. Useful for testing interpolations.
