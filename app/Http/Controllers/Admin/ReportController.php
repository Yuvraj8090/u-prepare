<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Contract;
use App\Models\Contractor;
use App\Models\PackageProject;
use App\Models\SubPackageProject;
use App\Models\EpcEntryData;
use App\Models\BoqEntryData;
use App\Models\FinancialProgressUpdate;
use App\Models\PhysicalEpcProgress;
use App\Models\PhysicalBoqProgress;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        $contracts = Contract::with(['project:id,package_name', 'contractor:id,company_name'])
            ->select('id', 'contract_number', 'project_id', 'contractor_id', 'contract_value', 'count_sub_project', 'signing_date')
            ->latest()
            ->get();
        $packageProjects = PackageProject::withWorkProgramData()->latest()->get();

        return view('admin.reports.index',  compact('contracts', 'packageProjects'));
    }
}
