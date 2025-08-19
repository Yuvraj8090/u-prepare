<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\PackageComponent;
use App\Models\Contract;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        // Departments: with projects, contracts, and financial stats
        $departments = Department::withProjectAndContractStats()
            ->withFinancialStats()
            ->get();

        // Package Components with budgets
        $components = PackageComponent::select('id', 'name', 'budget')->get();

        // All Contracts with related info (make sure you have ->withBasicRelations() in Contract model)
        $contracts = Contract::withBasicRelations()->get();

        return view('admin.dashboard', compact('departments', 'components', 'contracts'));
    }
}
