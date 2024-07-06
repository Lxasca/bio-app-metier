<?php

namespace App\Controller;

use App\Entity\Sample;
use App\Entity\Test;
use App\Form\TestType;
use App\Repository\TestRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/test')]
class TestController extends AbstractController
{
    #[Route('/', name: 'app_test_index', methods: ['GET'])]
    public function index(TestRepository $testRepository): Response
    {
        return $this->render('test/index.html.twig', [
            'tests' => $testRepository->findAll(),
        ]);
    }

    #[Route('/new/{sampleId}', name: 'app_test_new', methods: ['GET', 'POST'])]
public function new(int $sampleId, Request $request, EntityManagerInterface $entityManager): Response
{
    $sample = $entityManager->getRepository(Sample::class)->find($sampleId);

    if (!$sample) {
        throw $this->createNotFoundException('No sample found for id ' . $sampleId);
    }

    $test = new Test();
    $test->setSample($sample);

    $form = $this->createForm(TestType::class, $test);
    $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()) {
        $entityManager->persist($test);
        $entityManager->flush();

        return $this->redirectToRoute('app_test_index', [], Response::HTTP_SEE_OTHER);
    }

    return $this->render('test/new.html.twig', [
        'test' => $test,
        'form' => $form->createView(),
        'isCreate' => true
    ]);
}

    #[Route('/{id}', name: 'app_test_show', methods: ['GET'])]
    public function show(Test $test): Response
    {
        return $this->render('test/show.html.twig', [
            'test' => $test,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_test_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Test $test, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(TestType::class, $test);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_test_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('test/edit.html.twig', [
            'test' => $test,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_test_delete', methods: ['POST'])]
    public function delete(Request $request, Test $test, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$test->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($test);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_test_index', [], Response::HTTP_SEE_OTHER);
    }
}
