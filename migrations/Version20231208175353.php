<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231208175353 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE events ADD fk_type_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE events ADD CONSTRAINT FK_5387574A3563B1BF FOREIGN KEY (fk_type_id) REFERENCES type (id)');
        $this->addSql('CREATE INDEX IDX_5387574A3563B1BF ON events (fk_type_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE events DROP FOREIGN KEY FK_5387574A3563B1BF');
        $this->addSql('DROP INDEX IDX_5387574A3563B1BF ON events');
        $this->addSql('ALTER TABLE events DROP fk_type_id');
    }
}
