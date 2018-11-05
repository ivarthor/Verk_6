<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Verkefni 6</title>
	<link rel="stylesheet" type="text/css" href="/static/styles.css">
</head>
<body>
	% from bottle import *
	% from beaker.middleware import SessionMiddleware
	% bs = request.environ.get('beaker.session')
	% empty = True

	<h2>Karfan:</h2>

% for i in range(6):
% 	if bs.get(str(i)):
%		empty = False
	% end
  %end
  % if empty:
  	<h3>Karfan er <i>Tóm</i>, Farðu að versla</h3>
	<a href="/">Til baka</a>
  % else:
  <table>
  	<tr>
  		<th>Vara:</th>
  		<th>Verð:</th>
  		<th>Fjarlægja vöru:</th>
  	</tr>
  		% sum = 0
  		% for i in range(6):
  			% if bs.get(str(i)):
  			%	sum = sum + int(val[int(i)]['price'])
  			<tr>
  				<td>{{val[int(i)]['name']}}</td>
  				<td>{{val[int(i)]['price']}}</td>
  				<td><a href="/del/{{i}}">Eyða</a></td>
  			</tr>
  			% end
  		% end
  			<tr>
  				<td>Heildaverð:</td>
  				<td><b>{{sum}} kr.</b></td>
  				<td><a href="/delall">Tæma</a></td>
  			</tr>
  </table>
  <a href="/">Til baka</a>	
  % end	
</body>
</html>