<?php

namespace App\Service;

use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;

class PaginatorService
{
    private $paginator;

    public function __construct(PaginatorInterface $paginator)
    {
        $this->paginator = $paginator;
    }

    public function paginate(Request $request, $query, int $limit)
    {
        return $this->paginator->paginate(
            $query,
            $request->query->getInt('page', 1),
            $limit
        );
    }
}