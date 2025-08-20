 <div class="row  mb-6">
     <div class="col-md-12">
         <h6 class="card-header bg-light text-secondary h2"><i class="fas fa-user-tie me-2"></i> Contractor Information</h6>

         <ul class="list-group list-group-flush">
             <li class="list-group-item d-flex justify-content-between align-items-center">
                 <p class="mb-0 d-flex align-items-center h3">
                     <i class="fas fa-building text-primary me-2"></i> Company Name
                 </p>
                 <span class="fw-bold h4">{{ $contractor->company_name ?? 'N/A' }}</span>
             </li>
             <li class="list-group-item d-flex justify-content-between align-items-center">
                 <p class="mb-0 d-flex align-items-center h3">
                     <i class="fas fa-receipt text-warning me-2"></i> GST Number
                 </p>
                 <span class="fw-bold h4">{{ $contractor->gst_no ?? 'N/A' }}</span>
             </li>
             <li class="list-group-item d-flex justify-content-between align-items-center">
                 <p class="mb-0 d-flex align-items-center h3">
                     <i class="fas fa-envelope text-info me-2"></i> Email
                 </p>
                 <span class="fw-bold h4">{{ $contractor->email ?? 'N/A' }}</span>
             </li>
             <li class="list-group-item d-flex justify-content-between align-items-center">
                 <p class="mb-0 d-flex align-items-center h3">
                     <i class="fas fa-phone text-success me-2"></i> Phone
                 </p>
                 <span class="fw-bold h4">{{ $contractor->phone ?? 'N/A' }}</span>
             </li>
             <li class="list-group-item d-flex justify-content-between align-items-start">
                 <p class="mb-0 d-flex align-items-center h3">
                     <i class="fas fa-map-marker-alt text-danger me-2 mt-1"></i> Address
                 </p>
                 <span class="fw-bold h4">{{ $contractor->address ?? 'N/A' }}</span>
             </li>
         </ul>
     </div>
 </div>
