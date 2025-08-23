<?php

namespace App\Helpers;

class StaticDataHelper
{
    /**
     * Static Citizen Corner Data
     */
    public static function citizenCornerData(): array
    {
        return [
            (object) ['img' => 'project-status.webp', 'name' => 'Projects Status', 'link' => '#'],
            (object) ['img' => 'tenders.webp', 'name' => 'Tenders & Notice', 'link' => '#'],
            (object) ['img' => 'grievance-register.webp', 'name' => 'Grievance Register', 'link' => '#'],
            (object) ['img' => 'grievance-status.webp', 'name' => 'Grievance Status', 'link' => '#'],
            (object) ['img' => 'vacancies.webp', 'name' => 'Vacancies', 'link' => '#'],
            (object) ['img' => 'suggestions.webp', 'name' => 'Suggestions', 'link' => '#'],
        ];
    }

    /**
     * Static Past Projects Data
     */
    public static function pastProjectsData(): array
    {
        return [
            (object) [
                'img' => 'assets/img/pps-bgi.webp',
                'bgc' => 'udrp',
                'title' => 'UDRP: Uttarakhand Disaster Recovery Project (2014-2019)',
                'name' => 'Past Projects',
                'link' => '#',
                'link_txt' => 'Learn More',
            ],
            (object) [
                'img' => 'assets/img/pps-bgi-af.webp',
                'bgc' => 'udrpaf',
                'title' => 'UDRP-AF: Uttarakhand Disaster Recovery Project - AF (2019-2023)',
                'name' => 'Past Projects',
                'link' => '#',
                'link_txt' => 'Learn More',
            ],
        ];
    }
}
