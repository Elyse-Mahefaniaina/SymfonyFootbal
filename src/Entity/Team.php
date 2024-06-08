<?php
// src/Entity/Team.php
namespace App\Entity;

use App\Repository\TeamRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TeamRepository::class)]
class Team
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer', nullable: false)]
    private int $id;

    #[ORM\Column(type: 'string', length: 255)]
    private ?string $name;

    #[ORM\ManyToOne(targetEntity: Country::class, inversedBy: 'teams')]
    #[ORM\JoinColumn(nullable: false)]
    private Country $country;

    #[ORM\Column(type: 'float', options: ['default' => 0])]
    private int $moneyBalance;

    #[ORM\OneToMany(targetEntity: Player::class, mappedBy: 'team', orphanRemoval: true)]
    private $players;

    public function __construct()
    {
        $this->players = new ArrayCollection();
        $this->moneyBalance = 0;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getCountry(): ?Country
    {
        return $this->country;
    }

    public function setCountry(?Country $country): self
    {
        $this->country = $country;

        return $this;
    }

    public function getMoneyBalance(): ?float
    {
        return $this->moneyBalance;
    }

    public function setMoneyBalance(float $moneyBalance): self
    {
        $this->moneyBalance = $moneyBalance;

        return $this;
    }

    /**
     * @return Collection|Player[]
     */
    public function getPlayers(): Collection
    {
        return $this->players;
    }

    public function addPlayer(Player $player): self
    {
        if (!$this->players->contains($player)) {
            $this->players[] = $player;
            $player->setTeam($this);
        }

        return $this;
    }

    public function removePlayer(Player $player): self
    {
        if ($this->players->removeElement($player)) {
            // set the owning side to null (unless already changed)
            if ($player->getTeam() === $this) {
                $player->setTeam(null);
            }
        }

        return $this;
    }
}
