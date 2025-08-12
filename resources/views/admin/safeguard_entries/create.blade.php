<x-app-layout>
    <div class="container py-4">
        <h2 class="mb-4 fw-bold text-primary">Add Safeguard Entry</h2>

        <form action="{{ route('admin.safeguard_entries.store') }}" method="POST">
            @csrf

            <div class="mb-3">
                <label class="form-label">Sub Package Project</label>
                <select name="sub_package_project_id" class="form-select" required>
                    @foreach($projects as $project)
                        <option value="{{ $project->id }}">{{ $project->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Safeguard Compliance</label>
                <select name="safeguard_compliance_id" class="form-select" required>
                    @foreach($compliances as $compliance)
                        <option value="{{ $compliance->id }}">{{ $compliance->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Construction Phase</label>
                <select name="contraction_phase_id" class="form-select" required>
                    @foreach($phases as $phase)
                        <option value="{{ $phase->id }}">{{ $phase->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">SL No</label>
                <input type="text" name="sl_no" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Item Description</label>
                <textarea name="item_description" class="form-control"></textarea>
            </div>

            <button type="submit" class="btn btn-success">Save</button>
            <a href="{{ route('admin.safeguard_entries.index') }}" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</x-app-layout>
