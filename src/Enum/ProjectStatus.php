<?php

namespace App\Enum;

use MyCLabs\Enum\Enum;
use PhpParser\Builder\Enum_;

class ProjectStatus extends Enum
{
    const OK = 1;
    const EN_COURS = 2;
    const PAS_COMMENCE = 3;
}