<?php

namespace App\Controller;

use App\Entity\Result;
use App\Form\ResultType;
use App\Repository\ResultRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/result')]
class ResultController extends AbstractController
{
    #[Route('/', name: 'app_result_index', methods: ['GET'])]
    public function index(ResultRepository $resultRepository, PaginatorInterface $paginator, Request $request): Response
    {
        $query = $resultRepository->findBy([], ['id' => 'DESC']);

        $results = $paginator->paginate(
            $query,
            $request->query->get('page', 1),
            5
        );

        return $this->render('result/index.html.twig', [
            'results' => $results,
        ]);
    }

    #[Route('/new', name: 'app_result_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $result = new Result();
        $form = $this->createForm(ResultType::class, $result);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($result);
            $entityManager->flush();

            return $this->redirectToRoute('app_result_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('result/new.html.twig', [
            'result' => $result,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_result_show', methods: ['GET'])]
    public function show(Result $result): Response
    {
        return $this->render('result/show.html.twig', [
            'result' => $result,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_result_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Result $result, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(ResultType::class, $result);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_result_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('result/edit.html.twig', [
            'result' => $result,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_result_delete', methods: ['POST'])]
    public function delete(Request $request, Result $result, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$result->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($result);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_result_index', [], Response::HTTP_SEE_OTHER);
    }
}
