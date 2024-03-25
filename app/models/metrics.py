from dataclasses import dataclass
import json


@dataclass
class Metric:
    application_type: str
    fee: int
    fee_reduction_sports: bool
    fee_reduction_parish_council: bool
    fee_reduction_alternative: bool
    applicant_type: str
    latitude: int
    longitude: int
    local_authority_district: list[str]
    region: str
    property_type: str
    project_type: str
    submission_date: str

    def sql_string(self, idx):
        return (idx, self.application_type, self.fee, self.fee_reduction_sports, self.fee_reduction_parish_council, self.fee_reduction_alternative, self.applicant_type, self.latitude, self.longitude, self.local_authority_district, self.region, self.property_type, self.project_type, self.submission_date)
