<?php

namespace App\Form;

use App\Entity\Events;
use App\Entity\type;
//use PHPUnit\TextUI\XmlConfiguration\File;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
//use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Validator\Constraints\File;


class EventsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', null, [
                'attr' => ['class' => 'form', 'placeholder' => 'Name of the event'],
                'label' => 'Event name'
            ])
            ->add('date_time', null, [
                'attr' => ['class' => 'form'],
                'label' => 'Date of the event',
                'widget' => 'single_text'
            ])
            ->add('description', null, [
                'attr' => ['class' => 'form', 'placeholder' => 'Description'],
                'label' => 'Event description'
            ])
            //->add('image')
            ->add('image', FileType::class, [
                'attr' => ['class' => 'form'],
                'label' => 'Product image',
                'mapped' => false,
                'required' => false,
                'constraints' => [
                    new File([
                        'maxSize' => '1024k',
                        'mimeTypes' => [
                            'image/png',
                            'image/jpg',
                            'image/jpeg'
                        ],
                        'mimeTypesMessage' => 'Please upload a valid image type',
                    ])
                ],
            ])
            ->add('capacity', null, [
                'attr' => ['class' => 'form', 'placeholder' => 'Capacity of the event'],
                'label' => 'Capacity'
            ])
            ->add('email', null, [
                'attr' => ['class' => 'form', 'placeholder' => 'Organizer email'],
                'label' => 'Email'
            ])
            ->add('phone_number', null, [
                'attr' => ['class' => 'form'],
                'label' => 'Phone number'
            ])
            ->add('address', null, [
                'attr' => ['class' => 'form', 'placeholder' => 'Where will the event take place?'],
                'label' => 'Event address'
            ])
            ->add('url', null, [
                'attr' => ['class' => 'form'],
                'label' => 'Website'
            ])
            ->add('fk_type', EntityType::class, [
                'class' => type::class,
                'choice_label' => 'name',
                'label' => 'Type of the event',
                'attr' => ['class' => 'form']

            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Events::class,
        ]);
    }
}
