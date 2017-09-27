<p align="center">
  <img src="https://github.com/andreivmaksimov/ngn-bibf-techtalk-how-to-cook-your-cloud/raw/master/NGN_logo.png">
</p>
This is code examples for "How to cook your cloud, have free time and save money" TechTalk at Bahrain. All you need is to clone this repository, install Terraform and Ansible and play with this examples:

## Init terraform

This command will download Terraform AWS plugin

```sh
terraform init
```

## Show changes

```sh
terraform plan
```

## Apply changes

```sh
terraform apply
```

## Get dependency graph

```sh
terraform graph | dot -Tpng > graph.png
```

&copy; [Andrei Maksimov](https://www.linkedin.com/in/avmaksimov/) / [NGN](http://www.ngn.com.tr/)
--