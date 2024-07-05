<?php

namespace App\Form;

use App\Entity\Project;
use App\Entity\Sample;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class SampleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('type', TextType::class, [
                'label' => false,
                'attr' => [
                    'class' => 'form-control mb-3'
                ]
            ])
            ->add('source', ChoiceType::class, [
                'label' => false,
                'choices' => [
                    'Eau' => 0,
                    'Air' => 1,
                    'Aliments' => 2,
                ],
                'attr' => [
                    'class' => 'form-control mb-3'
                ]
            ])
            ->add('collectionDate', null, [
                'label' => false,
                'widget' => 'single_text',
                'attr' => [
                    'class' => 'form-control mb-3'
                ]
            ])
            ->add('status', ChoiceType::class, [
                'label' => false,
                'choices' => [
                    'En attente' => 0,
                    'En cours d\'analyse' => 1,
                    'Complété' => 2,
                ],
                'attr' => [
                    'class' => 'form-control mb-3'
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Enregistrer',
                'attr' => [
                    'class' => 'btn btn-rounded btn-light shadow mt-3'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Sample::class,
        ]);
    }
}
