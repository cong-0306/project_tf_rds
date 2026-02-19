# project_tf_rds
Terraform을 사용하여 AWS RDS (Primary + Cross-Regiion Read Replica) 환경을 구성하는 모듈

본 구성은 ROSA(OpenShift) 환경에서 사용할 PostgreSQL RDS를 생성하며, DR(재해 복구)을 위해 Cross-Region ReadReplica를 함께 구성


## 📌Architecture Overview

- Primary RDS: ap-northeast-2 (Seoul)
- DR Replica: ap-southeast-1 (Singrapore)
- Engine: PostgreSQl 15
- Private RDS (publicly_accessible = false)
- Dev 환경 기준 Single-AZ


## 📁 Project Structure

```bash
rds/
├─ main.tf
├─ variales.tf
├─ outputs.tf
├─ provider.tf
├─ terraform.tfvars.example
└─ .gitignore
```

※ `terraform.tfvars` 파일은 보안상 Git에 업로드하지 않는다.


## ⚙ Usage

### 1. terraform.tfvars 생성

`terraform.tfvars.example`을 복사하여 `terraform.tfvars` 파이리 생성

```bash
cp terraform.tfvars.example terraform.tfvars
```
필요한 값들을 실제 환경에 맞게 수정한다.

### 2. 초기화

```bash
terraform init
```

### 3. 실행

```bash
terraform apply
```

### 4. 삭제

```bash
terraform destroy
```
RDS 및 Replica 포함 전체 리소스가 삭제되니 명령어 사용 시 주의


## 🔐 Security Notes

- `terraform.tfvars` 파일에는 실제 DB 비밀번호가 포함될 수 있다.
- 해당 파일은 `.gitignore`에 의해 Git에서 제외
- 민감 정보는 환경변수 (`TF_VAR_db_password`) 사용을 권장


## ⚠ Important

- 운영 환경에서는 `multi_az = true` 설정을 권장한다.
- `force_destroy` 옵션 사용 시 데이터가 완전히 삭제될 수 있으므로 주의 필요
