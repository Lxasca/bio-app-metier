<?php

namespace App\Controller;

use App\Entity\Project;
use App\Entity\Sample;
use App\Form\SampleType;
use App\Repository\SampleRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/sample')]
class SampleController extends AbstractController
{
    #[Route('/', name: 'app_sample_index', methods: ['GET'])]
    public function index(SampleRepository $sampleRepository): Response
    {
        return $this->render('sample/index.html.twig', [
            'samples' => $sampleRepository->findAll(),
        ]);
    }

    #[Route('/new/project/{id}', name: 'app_sample_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager, $id): Response
    {
        $sample = new Sample();
        $form = $this->createForm(SampleType::class, $sample);
        $form->handleRequest($request);

        $project = $entityManager->getRepository(Project::class)->find($id);

        if ($form->isSubmitted() && $form->isValid()) {
            $sample->setProject($project);

            $entityManager->persist($sample);
            $entityManager->flush();

            return $this->redirectToRoute('app_project_show', [
                'id' => $project->getId()
            ], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sample/new.html.twig', [
            'sample' => $sample,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_sample_show', methods: ['GET'])]
    public function show(Sample $sample): Response
    {
        return $this->render('sample/show.html.twig', [
            'sample' => $sample,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_sample_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Sample $sample, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(SampleType::class, $sample);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_sample_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('sample/edit.html.twig', [
            'sample' => $sample,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_sample_delete', methods: ['POST'])]
    public function delete(Request $request, Sample $sample, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$sample->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($sample);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_sample_index', [], Response::HTTP_SEE_OTHER);
    }
}
