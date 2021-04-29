FROM hashicorp/terraform:0.12.31

ARG project_id=sentry-health-meet
ARG env_dir=prod
ARG location=northamerica-northeast1

WORKDIR /tf
COPY ./tf .
COPY terraform-credentials.json .

RUN export GOOGLE_CREDENTIALS=$(cat /tf/terraform-credentials.json) && export GOOGLE_APPLICATION_CREDENTIALS=$(cat /tf/terraform-credentials.json)
RUN ls

RUN terraform init
# RUN terraform plan
RUN terraform apply -auto-approve