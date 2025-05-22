# Конфигурация Terraform для S3-совместимого хранилища в Yandex Cloud

Данный проект предназначен для создания S3-совместимого хранилища в Yandex Cloud с использованием Terraform.

## Необходимые условия
- Установленный Terraform версии 0.12 или выше
- Аккаунт в Yandex Cloud
- API токен Yandex Cloud
- Идентификаторы облака и папки (Cloud ID и Folder ID)
    
## Установка и настройка Terraform
Инструкции по получению ключей и настройке Yandex Cloud провайдера для Terraform доступны в [официальной документации](https://yandex.cloud/en-ru/docs/tutorials/infrastructure-management/terraform-quickstart).

## Как использовать
1. Откройте файл `terraform.tfvars` и заполните следующие параметры:
	- `yc_token`
	- `yc_cloud_id`
	- `yc_folder_id`
	- `bucket_name`
	- `bucket_access_key`
	- `bucket_secret_key`
        
2. Инициализируйте проект Terraform:
```sh
terraform init
```

3. Просмотрите план развертывания:
```sh
terraform plan
```

4. Примените конфигурацию:
```sh
terraform apply
```

## Описание переменных
- `yc_token` — API токен для доступа к Yandex Cloud
- `yc_cloud_id` — идентификатор облака
- `yc_folder_id` — идентификатор папки
- `yc_zone` — зона размещения ресурсов (по умолчанию: `ru-central1-a`)
- `bucket_name` — имя создаваемого бакета
- `bucket_access_key` — ключ доступа к бакету
- `bucket_secret_key` — секретный ключ для доступа к бакету

## Выходные параметры
- `bucket_name` — имя созданного бакета
- `bucket_domain_name` — доменное имя бакета