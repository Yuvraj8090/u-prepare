<?php

if (!function_exists('formatDate')) {
    function formatDate($date, $format = 'd M Y') {
        if (empty($date)) return 'N/A';
        
        try {
            return \Carbon\Carbon::parse($date)->format($format);
        } catch (\Exception $e) {
            return 'N/A';
        }
    }
}