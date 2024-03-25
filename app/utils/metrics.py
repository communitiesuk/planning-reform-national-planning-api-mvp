from models.metrics import Metric


def extract_metrics(message):
    return Metric(
        application_type=message["data"]["application"]["type"]["value"],
        fee=message["data"]["application"]["fee"]["calculated"],
        fee_reduction_sports=message["data"]["application"]["fee"]["reduction"]["sports"],
        fee_reduction_parish_council=message["data"]["application"]["fee"]["reduction"]["parishCouncil"],
        fee_reduction_alternative=message["data"]["application"]["fee"]["reduction"]["alternative"],
        applicant_type=message["data"]["applicant"]["type"],
        latitude=message["data"]["property"]["address"]["latitude"],
        longitude=message["data"]["property"]["address"]["longitude"],
        local_authority_district=message["data"]["property"]["localAuthorityDistrict"],
        region=message["data"]["property"]["region"],
        property_type=message["data"]["property"]["type"]["value"],
        project_type=message["data"]["proposal"]["projectType"][0]["value"],
        submission_date=message["metadata"]["submittedAt"]
    )
