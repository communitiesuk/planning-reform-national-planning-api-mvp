from dataclasses import dataclass
import json


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

    def sql_string(self, idx):
        return (idx, self.application_type, self.fee, f'{json.dumps(self.fee_reduction)}', self.applicant_type, self.latitude, self.longitude, self.local_authority_district, self.region, self.property_type, self.project_type, self.submission_date)
