<x-app-layout>
    <div class="container-fluid">
        <!-- Header + Breadcrumb -->
        <div class="row mb-4">
            <div class="col-md-12 d-flex justify-content-between align-items-center">
                <h4 class="mb-0">
                    <i class="fas fa-users me-2 text-primary"></i>
                    {{ isset($user) ? 'Edit User' : 'Create User' }}
                </h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}"><i class="fas fa-home"></i></a></li>
                        <li class="breadcrumb-item">Admin</li>
                        <li class="breadcrumb-item"><a href="{{ route('admin.users.index') }}">Users</a></li>
                        <li class="breadcrumb-item active">{{ isset($user) ? 'Edit' : 'Create' }}</li>
                    </ol>
                </nav>
            </div>
        </div>

        <!-- Form Card -->
        <div class="card shadow-sm">
            <div class="card-header bg-white d-flex justify-content-between align-items-center">
                <h5 class="mb-0 text-primary">
                    <i class="fas {{ isset($user) ? 'fa-edit' : 'fa-user-plus' }} me-2"></i>
                    {{ isset($user) ? 'Edit User Details' : 'Create New User' }}
                </h5>
                <a href="{{ route('admin.users.index') }}" class="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-arrow-left me-1"></i> Back to Users
                </a>
            </div>

            <div class="card-body">
                <form action="{{ isset($user) ? route('admin.users.update', $user) : route('admin.users.store') }}"
                    method="POST" enctype="multipart/form-data">
                    @csrf
                    @if (isset($user))
                        @method('PUT')
                    @endif

                    <div class="row g-3">
                        {{-- Full Name --}}
                        <div class="col-md-4">
                            <x-label for="name" value="Full Name" required />
                            <x-input id="name" name="name" value="{{ old('name', $user->name ?? '') }}"
                                required />
                        </div>

                        {{-- Email --}}
                        <div class="col-md-4">
                            <x-label for="email" value="Email" required />
                            <x-input type="email" name="email" value="{{ old('email', $user->email ?? '') }}"
                                required />
                        </div>

                        {{-- Phone --}}
                        <div class="col-md-4">
                            <x-label for="phone_no" value="Phone No." />
                            <x-input name="phone_no" value="{{ old('phone_no', $user->phone_no ?? '') }}" />
                        </div>

                        {{-- Role --}}
                        <div class="col-md-4">
                            <x-bootstrap.dropdown id="role_id" name="role_id" label="Role" required
                                :items="$roles
                                    ->map(fn($role) => ['value' => $role->id, 'label' => ucfirst($role->name)])
                                    ->toArray()" :selected="old('role_id', $user->role_id ?? '')" />
                        </div>


                        {{-- Department --}}
                        <div class="col-md-4">
                            <x-bootstrap.dropdown id="department_id" name="department_id" label="Department"
                                :items="$departments
                                    ->map(fn($d) => ['value' => $d->id, 'label' => $d->name])
                                    ->toArray()" :selected="old('department_id', $user->department_id ?? '')" required />

                        </div>

                        {{-- Designation --}}
                        <div class="col-md-4">
                            <x-bootstrap.dropdown id="designation_id" name="designation_id" label="Designation"
                                :items="$designations
                                    ->map(fn($d) => ['value' => $d->id, 'label' => $d->title])
                                    ->toArray()" :selected="old('designation_id', $user->designation_id ?? '')" />
                        </div>


                        {{-- Gender --}}
                        <div class="col-md-4">
                            <x-bootstrap.dropdown id="gender" name="gender" label="Gender" :items="collect(['male', 'female', 'other'])
                                ->map(fn($g) => ['value' => $g, 'label' => ucfirst($g)])
                                ->toArray()"
                                :selected="old('gender', $user->gender ?? '')" />
                        </div>


                        {{-- District --}}
                        <div class="col-md-4">
                            <x-label for="district" value="District" />
                            <x-input name="district" value="{{ old('district', $user->district ?? '') }}" />
                        </div>

                        {{-- Status --}}
                        <div class="col-md-4">
                            <x-bootstrap.dropdown id="status" name="status" label="Status" required
                                :items="[
                                    ['value' => 'active', 'label' => 'Active'],
                                    ['value' => 'inactive', 'label' => 'Inactive'],
                                ]" :selected="old('status', $user->status ?? '')" />
                        </div>


                        {{-- Password --}}
                        <div class="col-md-4">
                            <x-label for="password" value="Password" :required="!isset($user)" />
                            <x-input type="password" name="password" />
                            @if (isset($user))
                                <small class="text-muted">Leave blank to keep current password</small>
                            @endif
                        </div>

                        {{-- Confirm Password --}}
                        <div class="col-md-4">
                            <x-label for="password_confirmation" value="Confirm Password" :required="!isset($user)" />
                            <x-input type="password" name="password_confirmation" />
                        </div>

                        {{-- Profile Photo --}}
                        <div class="col-md-4">
                            <x-label for="profile_photo" value="Profile Photo" />

                            {{-- Image Preview --}}
                            <img id="profilePreview"
                                src="{{ isset($user) && $user->profile_photo_url ? $user->profile_photo_url : '' }}"
                                class="rounded mt-2 {{ isset($user) && $user->profile_photo_url ? '' : 'd-none' }}"
                                width="80" height="80" alt="Profile Photo Preview">

                            {{-- File Input --}}
                            <input type="file" id="profile_photo" name="profile_photo" class="form-control mt-2"
                                accept="image/*">
                        </div>

                    </div>

                    <div class="mt-4 d-flex justify-content-end border-top pt-3">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas {{ isset($user) ? 'fa-save' : 'fa-user-plus' }} me-1"></i>
                            {{ isset($user) ? 'Update User' : 'Create User' }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('profile_photo')?.addEventListener('change', function(e) {
            const file = e.target.files[0];
            const preview = document.getElementById('profilePreview');

            if (file && preview) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.src = e.target.result;
                    preview.classList.remove('d-none');
                };
                reader.readAsDataURL(file);
            }
        });
    </script>

</x-app-layout>
