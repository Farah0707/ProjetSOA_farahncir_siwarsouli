<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Interface Personnes</title>
    
    <style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Poppins', 'Segoe UI', sans-serif;
        max-width: 1100px;
        margin: 30px auto;
        padding: 25px;
        background: linear-gradient(135deg, #ffd6e8, #ffeaf4, #fff0f7);
    }

    .container {
        background: linear-gradient(180deg, #ffffff, #fff5fa);
        padding: 32px;
        border-radius: 18px;
        box-shadow: 0 12px 30px rgba(255, 105, 180, 0.25);
    }

    h1 {
        text-align: center;
        font-weight: 600;
        margin-bottom: 30px;
        color: #b5179e;
        border-bottom: 3px solid transparent;
        border-image: linear-gradient(to right, #ff4d8d, #ff8fab);
        border-image-slice: 1;
        padding-bottom: 12px;
    }

    h2 {
        color: #9d4edd;
        margin-bottom: 14px;
        font-size: 1.3em;
    }

    .section {
        background: linear-gradient(135deg, #fff0f7, #ffe5f1);
        padding: 20px;
        margin-bottom: 24px;
        border-radius: 14px;
        border-left: 7px solid #ff4d8d;
        box-shadow: 0 6px 15px rgba(255, 77, 141, 0.15);
    }

    .method {
        display: inline-block;
        padding: 6px 14px;
        border-radius: 30px;
        color: white;
        font-size: 11px;
        font-weight: bold;
        letter-spacing: 1px;
        margin-right: 10px;
        background: linear-gradient(135deg, #ff4d8d, #ff85a1);
    }

    .get { background: linear-gradient(135deg, #ff85a1, #ffb3c6); }
    .post { background: linear-gradient(135deg, #f72585, #ff4d8d); }
    .put { background: linear-gradient(135deg, #ffb703, #ff85a1); }
    .delete { background: linear-gradient(135deg, #d00000, #ff4d6d); }

    label {
        font-weight: 600;
        color: #6a0572;
        margin-bottom: 6px;
        display: block;
    }

    input {
        width: 100%;
        padding: 10px;
        border-radius: 10px;
        border: 1px solid #ffc2d1;
        font-size: 14px;
        background-color: #fff;
    }

    input:focus {
        outline: none;
        border-color: #ff4d8d;
        box-shadow: 0 0 6px rgba(255, 77, 141, 0.4);
    }

    button {
        background: linear-gradient(135deg, #ff4d8d, #f72585);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 30px;
        cursor: pointer;
        font-size: 14px;
        margin-top: 8px;
        transition: all 0.3s ease;
    }

    button:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 14px rgba(247, 37, 133, 0.4);
    }

    .delete-btn {
        background: linear-gradient(135deg, #d00000, #ff4d6d);
    }

    .load-btn {
        background: linear-gradient(135deg, #ff85a1, #ffcad4);
        color: #6a0572;
        font-weight: bold;
    }

    .person-list {
        margin-top: 20px;
    }

    .person-item {
        background: linear-gradient(135deg, #ffffff, #fff0f7);
        border-radius: 14px;
        padding: 15px;
        margin-bottom: 14px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 5px 14px rgba(255, 77, 141, 0.15);
    }

    .person-id {
        background: linear-gradient(135deg, #ff4d8d, #f72585);
        color: white;
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        margin-right: 8px;
    }

    .person-name {
        font-weight: 600;
        color: #3a0ca3;
    }

    .person-age {
        color: #9a4f7c;
        margin-left: 10px;
    }

    .action-btn {
        padding: 6px 14px;
        font-size: 12px;
        border-radius: 20px;
    }

    .status {
        margin-top: 18px;
        padding: 12px;
        border-radius: 12px;
        font-size: 14px;
        display: none;
    }

    .success {
        background: linear-gradient(135deg, #d8f3dc, #b7e4c7);
        color: #1b4332;
        border: 1px solid #95d5b2;
    }

    .error {
        background: linear-gradient(135deg, #ffccd5, #ffb3c1);
        color: #7f1d1d;
        border: 1px solid #ff8fa3;
    }

    .debug-info {
        background: linear-gradient(135deg, #ffe5f1, #ffd6e8);
        padding: 14px;
        border-radius: 12px;
        font-size: 12px;
        color: #720026;
        margin-bottom: 24px;
        box-shadow: 0 4px 10px rgba(255, 77, 141, 0.2);
    }
</style>
</head>
<body>
    <div class="container">
        <h1>📋 Gestion des Utilisateurs</h1>
        
        <div class="debug-info">
            <strong>API URL:</strong> <span id="apiUrl"></span> |
            <strong>Statut:</strong> <span id="apiStatus">Non testé</span>
        </div>
        
        <!-- Liste des personnes -->
        <div class="section">
            <h2> Liste des personnes</h2>
            <button class="load-btn" onclick="loadPersons()">
                🔄 Charger toutes les personnes
            </button>
            
            <div id="personList" class="person-list">
                <!-- La liste sera chargée ici -->
            </div>
        </div>
        
        <!--  Ajouter une personne -->
        <div class="section">
            <h2> Ajouter une personne</h2>
            <div class="form-group">
                <label for="addName">Nom:</label>
                <input type="text" id="addName" placeholder="Entrez le nom">
            </div>
            <div class="form-group">
                <label for="addAge">Âge:</label>
                <input type="number" id="addAge" placeholder="Entrez l'âge">
            </div>
            <button onclick="addPerson()">➕ Ajouter</button>
        </div>
        
        <!--  Rechercher par ID -->
        <div class="section">
            <h2> Rechercher par ID</h2>
            <div class="form-group">
                <label for="searchId">ID de la personne:</label>
                <input type="number" id="searchId" placeholder="Entrez l'ID">
            </div>
            <button onclick="getPersonById()">🔍 Rechercher</button>
            
            <div id="searchResult" class="person-item" style="display:none; margin-top:15px;">
                <div class="person-info">
                    <span class="person-id" id="resultId"></span>
                    <span class="person-name" id="resultName"></span>
                    <span class="person-age" id="resultAge"></span>
                </div>

            </div>
        </div>
        
        <!--  Modifier une personne -->
        <div class="section">
            <h2>Modifier une personne</h2>
            <div class="form-group">
                <label for="editId">ID:</label>
                <input type="number" id="editId" placeholder="ID à modifier">
            </div>
            <div class="form-group">
                <label for="editName">Nouveau nom:</label>
                    <input type="text" id="editName" placeholder="Nouveau nom">
            </div>
            <div class="form-group">
                <label for="editAge">Nouvel âge:</label>
                <input type="number" id="editAge" placeholder="Nouvel âge">
            </div>
            <button onclick="updatePerson()">💾 Mettre à jour</button>
        </div>
        
        <!-- Supprimer une personne -->
        <div class="section">
            <h2>Supprimer une personne</h2>
            <div class="form-group">
                <label for="deleteId">ID à supprimer:</label>
                <input type="number" id="deleteId" placeholder="Entrez l'ID">
            </div>
            <button class="delete-btn" onclick="confirmDelete()">🗑️ Supprimer</button>
        </div>
        
        <!-- Messages de statut -->
        <div id="statusMessage" class="status"></div>
    </div>

    <script>
        //  URL de l'API
        const API_URL = 'http://localhost:8080/ProjetSOA/api/persons';
        
        // Afficher l'URL de l'API
        document.getElementById('apiUrl').textContent = API_URL;
        
        // Fonction pour échapper les caractères HTML
        function escapeHtml(text) {
            if (!text) return '';
            const map = {
                '&': '&amp;',
                '<': '&lt;',
                '>': '&gt;',
                '"': '&quot;',
                "'": '&#039;'
            };
            return text.toString().replace(/[&<>"']/g, function(m) { return map[m]; });
        }
        
        // Afficher un message de statut
        function showStatus(message, type) {
            const statusDiv = document.getElementById('statusMessage');
            statusDiv.textContent = message;
            statusDiv.className = 'status ' + type;
            statusDiv.style.display = 'block';
            
            setTimeout(() => {
                statusDiv.style.display = 'none';
            }, 5000);
        }
        
        // Tester la connexion à l'API
        async function testAPI() {
            try {
                const response = await fetch(API_URL);
                if (response.ok) {
                    document.getElementById('apiStatus').textContent = 'Connecté';
                    document.getElementById('apiStatus').style.color = 'green';
                    return true;
                } else {
                    document.getElementById('apiStatus').textContent = 'Erreur ' + response.status;
                    document.getElementById('apiStatus').style.color = 'red';
                    return false;
                }
            } catch (error) {
                document.getElementById('apiStatus').textContent = 'Erreur de connexion';
                document.getElementById('apiStatus').style.color = 'red';
                return false;
            }
        }
        
        // 1. Charger toutes les personnes
        async function loadPersons() {
            try {
                const response = await fetch(API_URL);
                
                if (!response.ok) {
                    throw new Error('Erreur HTTP ' + response.status);
                }
                
                const persons = await response.json();
                console.log('Données reçues:', persons);
                
                const listDiv = document.getElementById('personList');
                listDiv.innerHTML = '';
                
                if (!persons || persons.length === 0) {
                    listDiv.innerHTML = '<div class="person-item">Aucune personne trouvée</div>';
                    showStatus('Base de données vide', 'success');
                    return;
                }
                
                // Gérer différents formats de données
                let personsArray = persons;
                if (!Array.isArray(persons)) {
                    for (const key in persons) {
                        if (Array.isArray(persons[key])) {
                            personsArray = persons[key];
                            break;
                        }
                    }
                }
                
                // Créer les éléments person par person
                personsArray.forEach(person => {
                    const id = person.id || person.ID || person.personId || 0;
                    const name = person.name || person.nom || person.personName || 'Sans nom';
                    const age = person.age || person.ageValue || person.personAge || 0;
                    
                    // Créer l'élément principal
                    const personDiv = document.createElement('div');
                    personDiv.className = 'person-item';
                    
                    // Créer la div d'information
                    const infoDiv = document.createElement('div');
                    infoDiv.className = 'person-info';
                    
                    const idSpan = document.createElement('span');
                    idSpan.className = 'person-id';
                    idSpan.textContent = 'ID: ' + id;
                    
                    const nameSpan = document.createElement('span');
                    nameSpan.className = 'person-name';
                    nameSpan.textContent = name;
                    
                    const ageSpan = document.createElement('span');
                    ageSpan.className = 'person-age';
                    ageSpan.textContent = age + ' ans';
                    
                    infoDiv.appendChild(idSpan);
                    infoDiv.appendChild(nameSpan);
                    infoDiv.appendChild(ageSpan);
                    
                    // Créer la div d'actions
                    const actionsDiv = document.createElement('div');
                    actionsDiv.className = 'person-actions';
                    
                    
                    
                    // Assembler tout
                    personDiv.appendChild(infoDiv);
                    personDiv.appendChild(actionsDiv);
                    
                    listDiv.appendChild(personDiv);
                });
                
                showStatus('✅ ' + personsArray.length + ' personne(s) chargée(s)', 'success');
            } catch (error) {
                console.error('Erreur:', error);
                showStatus('❌ Erreur lors du chargement: ' + error.message, 'error');
            }
        }
        
        // 2. Ajouter une personne
        async function addPerson() {
            const name = document.getElementById('addName').value.trim();
            const age = document.getElementById('addAge').value;
            
            if (!name || !age) {
                showStatus('⚠️ Veuillez remplir tous les champs', 'error');
                return;
            }
            
            const person = { 
                name: name, 
                age: parseInt(age) 
            };
            
            try {
                const response = await fetch(API_URL, {
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify(person)
                });
                
                console.log('Réponse POST:', response.status);
                
                if (response.ok || response.status === 201) {
                    showStatus('✅ Personne ajoutée avec succès', 'success');
                    document.getElementById('addName').value = '';
                    document.getElementById('addAge').value = '';
                    loadPersons();
                } else {
                    const errorText = await response.text();
                    showStatus('❌ Erreur lors de l\'ajout: ' + response.status + ' - ' + errorText, 'error');
                }
            } catch (error) {
                showStatus('❌ Erreur réseau: ' + error.message, 'error');
            }
        }
        
        // 3. Rechercher une personne par ID
        async function getPersonById() {
            const id = document.getElementById('searchId').value.trim();
            
            if (!id) {
                showStatus('⚠️ Veuillez entrer un ID', 'error');
                return;
            }
            
            try {
                const response = await fetch(API_URL + '/' + id);
                
                if (response.ok) {
                    const person = await response.json();
                    console.log('Personne trouvée:', person);
                    
                    const personId = person.id || person.ID || person.personId;
                    const personName = person.name || person.nom || person.personName || 'Sans nom';
                    const personAge = person.age || person.ageValue || person.personAge || 0;
                    
                    document.getElementById('resultId').textContent = 'ID: ' + personId;
                    document.getElementById('resultName').textContent = personName;
                    document.getElementById('resultAge').textContent = personAge + ' ans';
                    document.getElementById('searchResult').style.display = 'flex';
                    
                    document.getElementById('editId').value = personId;
                    document.getElementById('editName').value = personName;
                    document.getElementById('editAge').value = personAge;
                    
                    showStatus('✅ Personne trouvée', 'success');
                } else if (response.status === 404) {
                    showStatus('❌ Personne non trouvée avec l\'ID ' + id, 'error');
                    document.getElementById('searchResult').style.display = 'none';
                } else {
                    const errorText = await response.text();
                    showStatus('❌ Erreur serveur: ' + response.status + ' - ' + errorText, 'error');
                }
            } catch (error) {
                showStatus('❌ Erreur: ' + error.message, 'error');
            }
        }
        
       
        
        // 4. Modifier une personne
        async function updatePerson() {
            const id = document.getElementById('editId').value;
            const name = document.getElementById('editName').value.trim();
            const age = document.getElementById('editAge').value;
            
            if (!id || !name || !age) {
                showStatus('⚠️ Veuillez remplir tous les champs', 'error');
                return;
            }
            
            const person = { 
                id: parseInt(id),
                name: name,
                age: parseInt(age)
            };
            
            console.log('Envoi de modification:', person);
            
            try {
                const response = await fetch(API_URL + '/' + id, {
                    method: 'PUT',
                    headers: { 
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify(person)
                });
                
                console.log('Réponse PUT:', response.status);
                
                if (response.ok) {
                    showStatus('✅ Personne modifiée avec succès', 'success');
                    loadPersons();
                    
                    const currentSearchId = document.getElementById('searchId').value;
                    if (currentSearchId === id) {
                        getPersonById();
                    }
                } else {
                    const errorText = await response.text();
                    console.error('Erreur détaillée:', errorText);
                    showStatus('❌ Erreur lors de la modification: ' + response.status + ' - ' + errorText, 'error');
                }
            } catch (error) {
                console.error('Erreur complète:', error);
                showStatus('❌ Erreur: ' + error.message, 'error');
            }
        }
        
        // 5. Supprimer une personne
        async function confirmDelete() {
            const id = document.getElementById('deleteId').value.trim();
            
            if (!id) {
                showStatus('⚠️ Veuillez entrer un ID', 'error');
                return;
            }
            
            if (confirm('Voulez-vous vraiment supprimer la personne avec l\'ID ' + id + ' ?')) {
                await deletePersonById(id);
                document.getElementById('deleteId').value = '';
            }
        }
        
        // Supprimer par ID
        async function deletePersonById(id) {
            if (!confirm('Voulez-vous vraiment supprimer la personne ID ' + id + ' ?')) {
                return;
            }
            
            try {
                const response = await fetch(API_URL + '/' + id, {
                    method: 'DELETE',
                    headers: {
                        'Accept': 'application/json'
                    }
                });
                
                console.log('Réponse DELETE:', response.status);
                
                if (response.ok) {
                    showStatus('✅ Personne supprimée avec succès', 'success');
                    
                    const resultId = document.getElementById('resultId').textContent.replace('ID: ', '');
                    if (resultId === id.toString()) {
                        document.getElementById('searchResult').style.display = 'none';
                    }
                    
                    loadPersons();
                } else {
                    const errorText = await response.text();
                    showStatus('❌ Erreur lors de la suppression: ' + response.status + ' - ' + errorText, 'error');
                }
            } catch (error) {
                showStatus('❌ Erreur: ' + error.message, 'error');
            }
        }
        
        
        
       
        
        // Initialisation
        window.addEventListener('load', async function() {
            console.log('Initialisation...');
            const connected = await testAPI();
            if (connected) {
                loadPersons();
            } else {
                showStatus('❌ Impossible de se connecter à l\'API. Vérifiez que le serveur est démarré.', 'error');
            }
        });
    </script>
</body>
</html>
