from dataclasses import dataclass


@dataclass
class Metric:
    application_type: str
    fee: int
    fee_reduction: dict
    applicant_type: str
    latitude: int
    longitude: int
    local_authority_district: list[str]
    region: str
    property_type: str
    project_type: str
    submission_date: str
