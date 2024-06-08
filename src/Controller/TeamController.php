<?php
namespace App\Controller;

use App\Entity\Team;
use App\Form\TeamType;
use App\Repository\TeamRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TeamController extends AbstractController
{

    #[Route('/', name: 'home')]
    public function home(): Response
    {
        return $this->redirectToRoute('team_index');
    }


    #[Route('/teams', name: 'team_index')]
    public function index(TeamRepository $teamRepository, PaginatorInterface $paginator, Request $request): Response
    {
        $queryBuilder = $teamRepository->createQueryBuilder('t')
            ->leftJoin('t.players', 'p')
            ->addSelect('p');

        $pagination = $paginator->paginate(
            $queryBuilder,
            $request->query->getInt('page', 1),
            1
        );

        return $this->render('team/index.html.twig', [
            'pagination' => $pagination,
        ]);
    }

    #[Route('/team/new', name: 'team_new')]
    public function new(Request $request, EntityManagerInterface $em): Response
    {
        $team = new Team();
        $form = $this->createForm(TeamType::class, $team);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($team);
            $em->flush();

            return $this->redirectToRoute('team_index');
        }

        return $this->render('team/new.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
