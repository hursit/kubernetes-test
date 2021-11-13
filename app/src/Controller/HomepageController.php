<?php

namespace App\Controller;

use App\Entity\Counter;
use App\Repository\CounterRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomepageController extends AbstractController
{
    /**
     * @Route("/", name="homepage")
     */
    public function index (EntityManagerInterface $entityManager, CounterRepository $counterRepository): Response
    {
        $entity = $counterRepository->find(1);

        $entity->setCount($entity->getCount() + 1);

        $entityManager->flush();

        return $this->render('homepage/index.html.twig', [
            'controller_name' => 'HomepageController',
            'count' => $entity->getCount()
        ]);
    }
}
