<?php
namespace App\Controller;

use App\Entity\Player;
use App\Form\PlayerTeamType;
use App\Form\PlayerTransferType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PlayerController extends AbstractController
{
    #[Route('/player/addToTeam', name: 'player_add_to_team')]
    public function addToTeam(Request $request, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(PlayerTeamType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();

            $p = new Player();
            $p->setName($data['name']);
            $p->setSurname($data['surname']);
            $p->setTeam($data['team']);


            $em->persist($p);
            $em->flush();

            return $this->redirectToRoute('team_index');
        }

        return $this->render('player/addToTeam.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/player/transfer', name: 'player_transfer')]
    public function transfer(Request $request, EntityManagerInterface $em): Response
    {
        $form = $this->createForm(PlayerTransferType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();
            $player = $data['player'];
            $newTeam = $data['toTeam'];
            $amount = $data['amount'];

            $oldTeam = $player->getTeam();

            // Update money balances
            $oldTeam->setMoneyBalance($oldTeam->getMoneyBalance() + $amount);
            $newTeam->setMoneyBalance($newTeam->getMoneyBalance() - $amount);

            // Transfer player
            $player->setTeam($newTeam);

            $em->flush();

            return $this->redirectToRoute('team_index');
        }

        return $this->render('player/transfer.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
