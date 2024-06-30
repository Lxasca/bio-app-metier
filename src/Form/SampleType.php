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
                'label' => 'Type'
            ])
            ->add('source', ChoiceType::class, [
                'label' => 'Type',
                'choices' => [
                    'Eau' => 0,
                    'Air' => 1,
                    'Aliments' => 2,
                ]
            ])
            ->add('collectionDate', null, [
                'label' => 'Date de prélèvement',
                'widget' => 'single_text',
            ])
            ->add('status', ChoiceType::class, [
                'label' => 'Type',
                'choices' => [
                    'En attente' => 0,
                    'En cours d\'analyse' => 1,
                    'Complété' => 2,
                ]
            ])
           /**->add('project', EntityType::class, [
                'class' => Project::class,
                'choice_label' => 'id',
            ])**/
            ->add('submit', SubmitType::class, [
                'label' => 'Enregistrer l\'échantillon'
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
