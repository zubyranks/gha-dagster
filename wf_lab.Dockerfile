# docker build -t <ecr_repo> -f upside.Dockerfile .
# docker tag <ecr_repo_name>:latest <ecr_repo_url>/<ecr_repo>:<tag_name>
# docker push <ecr_repo_url>/<ecr_repo>:<tag_name>

ARG BASE_IMAGE
FROM "python:3.7.13-slim"

ARG DAGSTER_VERSION

# All packages are hard-pinned to `dagster`, so setting the version on just `DAGSTER` will ensure
# compatible versions.
RUN pip install \
    dagster==0.12.10 \
    dagster-postgres==0.12.10 \
    dagster-k8s==0.12.10 \
    dagster-aws==0.12.10 \
    dagster-graphql \
    dagit==0.12.10

# Get example pipelines
COPY build_cache/ /