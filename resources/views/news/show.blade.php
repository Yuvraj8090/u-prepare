<x-guest-layout>
    <div class="container py-4">

        <h1 class="mb-3">
            {!! $lang === 'hi' ? $adminnews->title_hi : $adminnews->title_en !!}
        </h1>

        <p class="mb-4">
            {!! $lang === 'hi' ? $adminnews->body_hi : $adminnews->body_en !!}
        </p>

        @if($adminnews->file)
            <p>
                <a href="{{ Storage::url($adminnews->file) }}" target="_blank" class="btn btn-primary">
                    {!! $lang === 'hi' ? 'संलग्न देखें' : 'View Attachment' !!}
                </a>
            </p>
        @endif

    </div>
</x-guest-layout>
