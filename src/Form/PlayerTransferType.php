<?php

namespace App\Form;

use App\Entity\Player;
use App\Entity\Team;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PlayerTransferType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('player', EntityType::class, [
                'class' => Player::class,
                'choice_label' => 'name',
                'attr' => ['class' => 'form-control']
            ])
            ->add('fromTeam', EntityType::class, [
                'class' => Team::class,
                'choice_label' => 'name',
                'attr' => ['class' => 'form-control']
            ])
            ->add('toTeam', EntityType::class, [
                'class' => Team::class,
                'choice_label' => 'name',
                'attr' => ['class' => 'form-control']
            ])
            ->add('amount', NumberType::class, [
                'attr' => ['class' => 'form-control']
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([]);
    }
}
