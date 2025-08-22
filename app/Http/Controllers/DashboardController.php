<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\PackageComponent;
use App\Models\Contract;
use App\Models\TypeOfProcurement;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
{
    // Departments with stats
    $departments = Department::withProjectAndContractStats()
        ->withFinancialStats()
        ->get();

    // Package Components
    $components = PackageComponent::select('id', 'name', 'budget')->get();

    // Contracts
    $contracts = Contract::withBasicRelations()->get();

    // Type of Procurement
    $typeOfprocurement = TypeOfProcurement::select('id', 'name', 'description')->get();

    return view('admin.dashboard', compact(
        'departments',
        'components',
        'contracts',
        'typeOfprocurement'
    ));
}    public function index2()
{
    // Departments with stats
    $departments = Department::withProjectAndContractStats()
        ->withFinancialStats()
        ->get();

    // Package Components
    $components = PackageComponent::select('id', 'name', 'budget')->get();

    // Contracts
    $contracts = Contract::withBasicRelations()->get();

    // Type of Procurement
    $typeOfprocurement = TypeOfProcurement::select('id', 'name', 'description')->get();

    return view('admin.dashboard', compact(
        'departments',
        'components',
        'contracts',
        'typeOfprocurement'
    ));
}


}
