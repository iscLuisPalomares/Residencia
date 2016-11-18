var appusuarios = angular.module('appusuarios', ['ngRoute', 'ngCookies']);

appusuarios.config(['$httpProvider', function($httpProvider) {
	$httpProvider.defaults.useXDomain = true;
	delete $httpProvider.defaults.headers.common['X-Requested-With'];
}]);

appusuarios.config(['$routeProvider', function($routeProvider) {
	$routeProvider.
	when('/login', {
		templateUrl: '../views/usuarios/login.html',
		controller: 'controller'
	}).
	when('/juntas', {
		templateUrl: '../views/usuarios/juntas.html',
		controller: 'controller'
	}).
	otherwise({
		redirectTo: '/login'
	});
}]);

appusuarios.controller('controller', function($scope, $http, $cookies) {
	var juntas = "";
	var islogged = false;
	var idusuario = $cookies.get("id_usuario");
	if ($cookies.get("islogged") == "1"){
		islogged = true;
		$scope.islogged = '1';
		getmisjuntas(idusuario);
	} else {
		islogged == false;
		$scope.islogged = '0';
	}
	//crear funcion al scope para que regrese solo un registro
	$scope.login = function(){
	var username = "";
	var password = "";
	username = $scope.muser;
	password = $scope.mpass;
	$http.post('/sija/scripts/postlogin.php',{user:username, pass:password}).then(function successCallback(res){
		if (res.data.success == "1"){
			alert("Autenticado");
			$cookies.put("islogged", "1");
			islogged = true;
			$scope.islogged = '1';
			idusuario = res.data.iduser;
			$cookies.put("id_usuario", idusuario);
			console.log(idusuario);
		} else {
			alert("Usuario/Contrasena invalidos");
		}
	});
};

	$scope.logout = function(){
		$cookies.put("islogged", "0");
		islogged = false;
		$scope.islogged = '0';
		idusuario = null;
		$cookies.put("id_usuario", "");
	};

	function getmisjuntas(id_usuario) {
		$http.post('/sija/scripts/misjuntas.php', {userid:id_usuario}).then(function successCallback(res){
			if (res.data.success == "1"){
				info = res.data.datos;
				if (islogged){
					$scope.juntas = info;
				} else {
					$scope.juntas = "";
				}
			}
		});
	}
	$scope.veracuerdos = function(id_junta){
	$scope.acuerdosid_junta = id_junta;
	$http.post("/sija/scripts/acuerdos_por_junta.php", {num:id_junta}).then(function successCallback(res){
		if (res.data.success == "1"){
			var temp = res.data.datos;
			$scope.acuerdos = temp;
			$cookies.put("junta", id_junta);
		} else {
			$scope.acuerdos = "";
		}
	});
};
});


var appsecretaria = angular.module('appsecretaria', ['ngRoute', 'ngCookies']);

appsecretaria.config(['$httpProvider', function($httpProvider) {
	$httpProvider.defaults.useXDomain = true;
	delete $httpProvider.defaults.headers.common['X-Requested-With'];
}]);

appsecretaria.config(['$routeProvider', function($routeProvider) {
	$routeProvider.
	when('/login', {
		templateUrl: '../views/secretaria/login.html',
		controller: 'controller'
	}).
	when('/main', {
		templateUrl: '../views/secretaria/juntas.html',
		controller: 'controller'
	}).
	when('/acuerdos', {
		templateUrl: '../views/secretaria/acuerdos.html',
		controller: 'controller'
	}).
	when('/crearusuario', {
		templateUrl: '../views/secretaria/crearusuario.html',
		controller: 'controller'
	}).
	when('/enviarcorreos',{
		templateUrl: '../views/secretaria/enviarcorreos.html',
		controller: 'controller'
	}).
	when('/asistencia',{
		templateUrl: '../views/secretaria/asistencia.html',
		controller: 'controller'
	}).
	when('/usuarios',{
		templateUrl: '../views/secretaria/usuarios.html',
		controller: 'controller'
	}).
	otherwise({ 
		redirectTo: '/login'
	});
}]);

var info;

appsecretaria.controller('controller', function($scope, $http, $cookies, $location) {
	var juntas = "";
	var islogged = false;
	var nojunta = 0;
	var username_user = "";
	var email_user = "";
	if ($cookies.get("islogged") == "1"){
		islogged = true;
		$scope.islogged = '1';
		getjuntaslist();
		getuserslist();
		//$location.url("http://idtobby.com/sija/appsecretaria/mainsecretaria#/main")
} else {
	islogged == false;
	$scope.islogged = '0';
}

//FUNCIONES
function getjuntaslist(){
	$http.post('/sija/scripts/postjuntaslist.php').then(function successCallback(res){
		if (res.data.success == "1"){
			info = res.data.datos;
			if (islogged){
				$scope.juntas = info;
			} else {
				$scope.juntas = "";
			}
		}
	});
}
function getuserslist(){
	$http.post('/sija/scripts/postusuarioslist.php').then(function successCallback(res){
		if (res.data.success == "1"){
			info = res.data.datos;
			if (islogged){
				$scope.usuarios = info;
			} else {
				$scope.usuarios = "";
			}
		}
	});
}


$scope.usuarios_showdetail = function(idusuario){
	no = idusuario;
	$http.post("/sija/scripts/postusuariodata.php", {num:no}).then(function successCallback(res){
		console.log(res.data);
		var temp = res.data;
		console.log(temp.success);
		if (res.data.success == 1){
			$scope.id_user = temp.fsid;
			$scope.username_user = temp.fsusername;
			$scope.email_user = temp.fsemail;
		} else {
			$scope.id_user = "";
			$scope.username_user = "";
			$scope.email_user = "";
		}
	});
}
$scope.actualizarusuario = function(){
	var fsiduser = $scope.id_user;
	var fsusername = $scope.username_user;
	var fsemail = $scope.email_user;
	$http.post("/sija/scripts/postupdateuserdata.php", {iduser:fsiduser, nombre:fsusername, correo:fsemail}).then(function successCallback(res){
		if (res.data.success == 1){
			alert("Listo");
			getuserslist();
		} else {
			alert("se presento un problema");
		}
	});
}
//PAGINA DE INVITADOS
$scope.logout = function(){
	$cookies.put("islogged", "0");
	islogged = false;
	$scope.islogged = '0';
};

$scope.login = function(){
	var username = "";
	var password = "";
	username = $scope.muser;
	password = $scope.mpass;
	$http.post('/sija/scripts/postlogin.php',{user:username, pass:password}).then(function successCallback(res){
		if (res.data.success == "1"){
			alert("Autenticado");
			$cookies.put("islogged", "1");
			islogged = true;
			$scope.islogged = '1';
		} else {
			alert("Usuario/Contrasena invalidos");
		}
	});
};

$scope.paginaprincipal_mostrardetalle = function(id_junta){
	nojunta = id_junta;
	$http.post("/sija/scripts/postinnerjoin.php", {num:nojunta}).then(function successCallback(res){
		if (res.data.success == "1"){
			var temp = res.data.datos;

			angular.forEach(temp, function(x){
				if (x.fsidjunta != null){
					x.checkbox_status = true;
				} else {
					x.checkbox_status = false;
				}
			})
			$scope.invitadoss = temp;

			$cookies.put("junta", id_junta);
		} else {
			$scope.invitadoss = "";
		}
	});
};

$scope.asistencia = function(idjunta){
	$http.post("/sija/scripts/postasistencia.php", {nojunta: idjunta}).then(function successCallback(res){
		if (res.data.success == "1"){
			var temp = res.data.datos;
			angular.forEach(temp, function(x){
				if (x.fsasistencia == "true"){
					x.checkbox_status = true;
				} else {
					x.checkbox_status = false;
				}
			});
			$scope.asistencias = temp;
		} else {
			alert("Se presento un error");
		}
	});
}

$scope.registrarasistencia = function(){
	$http.post("/sija/scripts/reset_meeting.php", {meeting:nojunta});
	angular.forEach($scope.asistencias, function(x){
		if (x.checkbox_status){
			$http.post("/sija/scripts/postregistrarasistencia.php", {registro:x.fsid});
		} else {
			$http.post("/sija/scripts/postregistrarinasistencia.php", {registro:x.fsid});
		}
	})
}

$scope.paginaprincipal_eliminarjunta = function(id){
	var juntanum = id;
	$http.post("/sija/scripts/postdelete.php", {idjunta: id}).then(function successCallback(res){
		if (res.data.success == "1"){
			getjuntaslist();
		} else {
			alert("Se presento un error");
		}
	});
};

$scope.desinvitar_usuario = function(id_usuario, id_junta){
	$http.post("/sija/scripts/postdelinvitado.php", {iduser:id_usuario, idjunta:id_junta}).then(function successCallback(res){
		if (res.data.success == "1"){

		} else {
			//alert("Error al eliminar");
		}
	})
}

$scope.paginaprincipal_checkall = function(){
	console.log($scope.invitadoss[0].email);
	angular.forEach($scope.invitadoss, function(x){
		x.checkbox_status = true;
	});
};

$scope.paginaprincipal_invitarseleccionados = function(){
	var nojunta = $cookies.get("junta");
	$http.post("/sija/scripts/reset_meeting.php", {meeting:nojunta});
	angular.forEach($scope.invitadoss, function(x){
		if (x.checkbox_status){
			$http.post("/sija/scripts/postinvitarajunta.php", {user:x.fsuserid, meeting:nojunta}).then(function successCallback(res){
				if (res.data.success = "1"){
				} else {
					alert("Error al invitar a usuario a la junta");
				}
			});
		} else {
			$scope.desinvitar_usuario(x.id_usuario, nojunta);
		}
	})
}

$scope.paginaprincipal_agregarjunta = function(fecha, tema){
	$scope.fecha = "";
	$scope.tema = "";
	$http.post("/sija/scripts/postagregar.php", {date: fecha, theme: tema}).then(function successCallback(res){
		if (res.data.success == "1"){
			getjuntaslist();
		} else {
			alert("Se presento un error al agregar la junta");
		}
	});
};

$scope.paginaacuerdos_mostrardetalle = function(id_junta){
	$scope.acuerdosid_junta = id_junta;
	$http.post("/sija/scripts/acuerdos_por_junta.php", {num:id_junta}).then(function successCallback(res){
		if (res.data.success == "1"){
			var temp = res.data.datos;
			$scope.acuerdos = temp;
			$cookies.put("junta", id_junta);
		} else {
			$scope.acuerdos = "";
		}
	});
};

$scope.paginaacuerdos_adjuntaracuerdo = function(id_junta, tit, acc){
	$http.post('/sija/scripts/adjuntar_acuerdo.php', {num:id_junta, asunto:tit, acuerdo:acc}).then(function successCallback(res){
		if (res.data.success == "1"){
			$scope.paginaacuerdos_mostrardetalle(id_junta);
		} else {
			alert("Se presento un problema");
		}
	});
};

$scope.paginacrearusuario_crearusuario = function(nombre, contrasena, correo){
	if ($scope.createuser_username == null || $scope.createuser_password == null || $scope.createuser_email == null){
		alert("Faltan campos");
		return false;
	} else {
		$http.post('/sija/scripts/crearusuario.php', {username:nombre, password:contrasena, email:correo}).then(function successCallback(res){
			if (res.data.success == '1'){
				alert("Usuario creado exitosamente");
			} else {
				alert("Usuario no creado, intente de nuevo");
			}
		});
	}
};
$scope.enviarcorreo = function(idjunta){
	console.log(idjunta);
	$http.post('/sija/scripts/enviarcorreo.php', {juntaid:idjunta}).then(function successCallback(res){

		if (res.data.success == true){
			alert("Correo enviado");
		} else {
			//alert("Problema al enviar el correo");
		}
	});
};

});