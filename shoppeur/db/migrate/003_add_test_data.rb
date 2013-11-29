#START:vcc
class AddTestData < ActiveRecord::Migration
  def self.up
#END:vcc    
    Product.create(:title => 'Bien développer pour le Web 2.0',
    :description => 
    %{<p>Adieu, absence d'accessibilité, soupes de balises, combinaisons de Javascript propriétaires et autres mauvais réflexes qui polluaient le Web 1.0. Créer des interfaces utilisateur bluffantes et interactives à la Web 2.0 (Gmail, Google Maps, Flickr, Netvibes...) est l'occasion d'instaurer de bonnes pratiques de développement garantissant le respect des normes, l'ergonomie et l'accessibilité des applications web. Une bible des meilleures pratiques de développement web et Ajax. </p>},
    :image_url =>   '/images/bien_developper.jpg',    
    :price => 39.90)

#START:vcc
    Product.create(:title => 'Design web : utiliser les standards',
      :description =>
      %{<p><em>"Site optimisé pour..." </em>: suffit-il d'ajouter le nom et la version de votre navigateur de prédilection pour en être quitte avec les problèmes de compatibilité sur le web ? Les options retenues par de nombreuses entreprises et designers web en agence - optimiser un site pour une version précise de navigateur ou développer autant de versions de sites qu'il existe de navigateurs et de versions de navigateurs- n'est ni pérenne ni économiquement viable. Elles n'aboutissent qu'à priver un nombre toujours croissant de visiteurs d'un accès aux sites, et à empêcher tes entreprises de toucher une portion non négligeable de leur cible. Cette spirale et cette course incessante à la compatibilité n'ont rien d'une fatalité. Il existe une solutions les standards du Web.</p>},
    :image_url => '/images/design_web.jpg',
    :price => 33.00)
    
    # . . .
#END:vcc

    Product.create(:title => 'Pratique du développement collaboratif avec SVN',
    :description => 
    %{<p>La création collaborative de logiciels et de documents nécessite d'en paralléliser l'édition, d'en suivre et conserver les différentes versions et branches dans le temps, d'en archiver chaque détail, depuis les répertoires jusqu'aux liens symboliques, et d'être capable de revenir en arrière à tout moment. C'est le rôle des outils de contrôle de versions que d'automatiser ce suivi, et Subversion, logiciel libre qui succède à CVS, y excelle.</p>},
    :image_url => '/images/svn.jpg',
    :price => 25.00)
    
  end

#START:vcc
  def self.down
    Product.delete_all
  end
end
#END:vcc
