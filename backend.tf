terraform {
    backend "s3" {
        endpoints = {s3 = "http://127.0.0.1:9000"}
        region = "main"
        skip_credentials_validation = true
        skip_requesting_account_id = true
        skip_metadata_api_check = true
        skip_region_validation = true
        use_path_style = true
        insecure = true
    }
}