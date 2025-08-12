<x-app-layout>
    <div class="container py-4">
        <h2 class="mb-4 fw-bold text-primary">Edit EPC Entry</h2>

        {{-- Success Message --}}
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show">
                {{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        @endif

        {{-- Validation Errors --}}
        @if($errors->any())
            <div class="alert alert-danger">
                <strong>There were some problems with your input:</strong>
                <ul class="mb-0">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('admin.epcentry_data.update', $entry->id) }}" method="POST">
            @csrf
            @method('PUT')

            {{-- Project Name (readonly) --}}
            <div class="mb-3">
                <label class="form-label">Project</label>
                <input type="text" class="form-control" value="{{ $entry->subPackageProject->name }}" readonly>
                <input type="hidden" name="sub_package_project_id" value="{{ $entry->sub_package_project_id }}">
            </div>

            {{-- SL No --}}
            <div class="mb-3">
                <label class="form-label">SL No</label>
                <input type="text" name="sl_no" class="form-control @error('sl_no') is-invalid @enderror"
                    value="{{ old('sl_no', $entry->sl_no) }}" required>
                @error('sl_no')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            {{-- Item Description --}}
            <div class="mb-3">
                <label class="form-label">Item Description</label>
                <textarea name="item_description" class="form-control @error('item_description') is-invalid @enderror" required>{{ old('item_description', $entry->item_description) }}</textarea>
                @error('item_description')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            {{-- Percent --}}
            <div class="mb-3">
                <label class="form-label">Percent</label>
                <input type="number" step="0.01" name="percent" class="form-control @error('percent') is-invalid @enderror"
                    value="{{ old('percent', $entry->percent) }}">
                @error('percent')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            {{-- Amount --}}
            <div class="mb-3">
                <label class="form-label">Amount</label>
                <input type="number" step="0.01" name="amount" class="form-control @error('amount') is-invalid @enderror"
                    value="{{ old('amount', $entry->amount) }}">
                @error('amount')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            {{-- Buttons --}}
            <button type="submit" class="btn btn-primary">Update</button>
            <a href="{{ route('admin.epcentry_data.index', ['sub_package_project_id' => $entry->sub_package_project_id]) }}" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</x-app-layout>
