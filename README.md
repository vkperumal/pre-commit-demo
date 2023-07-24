# PreCommit

## Requirements

Mac User follow below steps"

- Install [TFenv](https://github.com/tfutils/tfenv) which will use terraform version as defined on the code

    ```bash
    brew install tfenv
    ```

- Install [TFlint](https://github.com/terraform-linters/tflint). Linter for Terraform code

    ```bash
    brew install tflint
    ```

- Install [Terrascan](https://github.com/accurics/terrascan). Scans Terraform code to find security vulnerabilities

    ```bash
    brew install terrascan
    ```

- Install [pre-commit](https://pre-commit.com/). Helps in performing formatting and documenting before commiting

    ```bash
    brew install pre-commit
    ```

- Install [Terraform-docs](https://github.com/terraform-docs/terraform-docs). Tool to generate Docs for terraform modules

    ```bash
    brew install terraform-docs
    ```

## Mac Configuration

- Create a folder in home directory to store the terraform provider plugins in shared location rather than downloading everytime.

    ```bash
    mkdir ~/.terraform.d
    echo "plugin_cache_dir   = \"\$HOME/.terraform.d/plugin-cache\"" > ~/.terraformrc
    ```

- Pre-commit configuration.

    .pre-commit-config.yaml is the configuration file. If you want to skip pre-commit hooks you can do git commit with --no-verify option

    ```bash
    pre-commit install # will install hook scripts
    pre-commit run --all-files # will execute pre-commit hooks as per config file
    pre-commit run --all-files --verbose # run pre-commit in verbose mode for debugging
    pre-commit run <hook_id> # runs particular hook
    ```

Windows Users follow below steps:

- Install [Chocolatey](https://chocolatey.org/install#individual) which will help in installing tools easily. This is like apt for Windows.

- Install [Terraform](https://www.terraform.io/). Terraform Binary

    ```powershell
    choco install terraform
    ```

- Install [TFlint](https://github.com/terraform-linters/tflint). Linter for Terraform code

    ```powershell
    choco install tflint
    ```

- Install [Terrascan](https://github.com/accurics/terrascan). Scans Terraform code to find security vulnerabilities

    ```powershell
    choco install terrascan
    ```

- Install [pre-commit](https://pre-commit.com/). Helps in performing formatting and documenting before commiting

    ```powershell
    choco install python
    pip install pre-commit
    ```

- Install [Terraform-docs](https://github.com/terraform-docs/terraform-docs). Tool to generate Docs for terraform modules

    ```powershell
    choco install terraform-docs
    ```

## Windows Configuration

- Pre-commit configuration.

    .pre-commit-config.yaml is the configuration file. If you want to skip pre-commit hooks you can do git commit with --no-verify option

    ```powershell
    pre-commit install # will install hook scripts
    pre-commit run --all-files # will execute pre-commit hooks as per config file
    pre-commit run --all-files --verbose # run pre-commit in verbose mode for debugging
    pre-commit run <hook_id> # runs particular hook
    ```
