<?php

namespace App\Imports;

use App\Models\SafeguardEntry;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class SafeguardEntriesImport implements ToModel, WithHeadingRow
{
    protected $projectId;
    protected $complianceId;
    protected $phaseId;

    public function __construct($projectId, $complianceId, $phaseId)
    {
        $this->projectId = $projectId;
        $this->complianceId = $complianceId;
        $this->phaseId = $phaseId;
    }

    public function model(array $row)
    {
        return new SafeguardEntry([
            'sub_package_project_id' => $this->projectId,
            'safeguard_compliance_id' => $this->complianceId,
            'contraction_phase_id' => $this->phaseId,
            'sl_no' => $row['sl_no'] ?? null,
            'item_description' => $row['item_description'] ?? null,
        ]);
    }
}
