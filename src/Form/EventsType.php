<?php

namespace App\Form;

use App\Entity\Events;
use App\Entity\type;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EventsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name')
            ->add('date_time')
            ->add('description')
            ->add('image')
            ->add('capacity')
            ->add('email')
            ->add('phone_number')
            ->add('address')
            ->add('url')
            ->add('fk_type', EntityType::class, [
                'class' => type::class,
'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Events::class,
        ]);
    }
}
