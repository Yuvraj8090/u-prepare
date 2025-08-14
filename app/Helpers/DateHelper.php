<?php
if (!function_exists('formatDate')) {
    function formatDate($date, $format = 'd M Y') {
        if (empty($date)) return '';
        
        try {
            return \Carbon\Carbon::parse($date)->format($format);
        } catch (\Exception $e) {
            return '';
        }
    }
}
if (!function_exists('formatPrice')) {
    function formatPrice($price) {
        if (empty($price) && $price !== 0 && $price !== '0') {
            return '';
        }

        $priceStr = trim(strtoupper(strval($price)));

        // Convert CR to rupees
        if (strpos($priceStr, 'CR') !== false) {
            $num = floatval(str_replace('CR', '', $priceStr));
            $rupees = $num * 10000000;
        } else {
            $rupees = floatval(str_replace(',', '', $priceStr));
        }

        return '₹' . formatIndianCurrency(number_format($rupees, 2, '.', ''));
    }
}

if (!function_exists('formatIndianCurrency')) {
    function formatIndianCurrency($number) {
        $decimal = '';
        if (strpos($number, '.') !== false) {
            list($number, $decimal) = explode('.', $number);
            $decimal = '.' . $decimal;
        }

        $number = strrev($number);
        $formatted = '';
        for ($i = 0; $i < strlen($number); $i++) {
            if ($i == 3 || ($i > 3 && ($i - 1) % 2 == 0)) {
                $formatted .= ',';
            }
            $formatted .= $number[$i];
        }
        return strrev($formatted) . $decimal;
    }
}
