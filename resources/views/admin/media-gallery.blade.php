<x-app-layout>
    <div class="container py-4">
        <h2 class="mb-4">Media Gallery (Folders)</h2>

        <!-- nanogallery2 container -->
        <div id="nanogallery2" data-nanogallery2='{
            "thumbnailHeight": 150,
            "thumbnailWidth": 150,
            "thumbnailBorderVertical": 2,
            "thumbnailBorderHorizontal": 2,
            "thumbnailGutterWidth": 15,
            "thumbnailGutterHeight": 15,
            "thumbnailLabel": { "display": true, "position": "overImageOnBottom" },
            "galleryLastRowFull": true,
            "thumbnailHoverEffect2": "imageScaleIn80|labelAppear75"
        }'>
            @foreach ($filesGrouped as $folder => $files)
                @php
                    $lastImage = $files->filter(fn($f) => $f['isImage'])->last();
                    $folderThumb = $lastImage ? $lastImage['thumb'] : asset('icons/folder-icon.png');
                @endphp

                <!-- Folder Item -->
                <a href="#" data-ngkind="album" data-ngid="folder-{{ md5($folder) }}" data-ngthumb="{{ $folderThumb }}">
                    {{ $folder === '.' ? 'Root' : $folder }}
                </a>

                @foreach ($files as $file)
                    <a href="{{ $file['url'] }}"
                       data-ngalbumid="folder-{{ md5($folder) }}"
                       data-ngthumb="{{ $file['thumb'] }}">
                       {{ $file['filename'] }}
                    </a>
                @endforeach
            @endforeach
        </div>
    </div>

    <!-- nanogallery2 CSS -->
    <link rel="stylesheet" href="https://unpkg.com/nanogallery2/dist/css/nanogallery2.min.css" />

    <!-- nanogallery2 JS -->
    <script src="https://unpkg.com/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://unpkg.com/nanogallery2/dist/jquery.nanogallery2.min.js"></script>
</x-app-layout>
