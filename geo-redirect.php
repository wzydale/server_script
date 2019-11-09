<style>
</style>

<?php
	header('Cache-Control:no-cache,must-revalidate');  
	header('Pragma:no-cache');  
    $apiKey = "API_ACCESS_TOKEN";
    $ipaddr = get_client_ip();
    if ($ipaddr == 'UNKNOWN'){
    	$ipaddr = "114.114.114.114";
    }
    echo "Your IP Address:";
    echo $ipaddr;
	$location = get_geolocation($apiKey, $ipaddr);
    $decodedLocation = json_decode($location, true);
    $item = $_GET['item'];
    $flagaddr = $decodedLocation['country_flag'];
    $node_location = $decodedLocation['continent_code'];
    echo "<br>";
    echo "你来自于：";
    echo $decodedLocation['continent_name'];
    if ($node_location == ""){
    	echo "API接入失败";
    	$node_location = "AS";   //如果API失效，将返回亚太地区节点地址
    }
    echo "<br>当前最近节点: ";
    echo $node_location;
    if ($item == "flag"){
    	 Header("HTTP/1.1 301 Mved Permanently");
		 Header("Location: $flagaddr");
    } else if ($node_location == 'AS' and $item != "") {
         echo "<br>你来自亚太地区";
         Header("HTTP/1.1 301 Moved Permanently");
		 Header("Location: https://os.daletech.cn:880/$item");
    } else if ($node_location != 'AS' and $item != "") {
         echo "<br>你来自非亚太地区";
         Header("HTTP/1.1 301 Moved Permanently");
		 Header("Location: http://usdl.wzydale.cn/$item");
    } else {
    	echo "<br>请传入item请求参数使用<br>";
    }
     
   function get_geolocation($apiKey, $ipaddr, $lang = "en", $fields = "*", $excludes = "") {
        $url = "https://api.ipgeolocation.io/ipgeo?apiKey=".$apiKey."&ip=".$ipaddr."&lang=".$lang."&fields=".$fields."&excludes=".$excludes;
        $cURL = curl_init();

        curl_setopt($cURL, CURLOPT_URL, $url);
        curl_setopt($cURL, CURLOPT_HTTPGET, true);
        curl_setopt($cURL, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($cURL, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json',
            'Accept: application/json'
        ));
        return curl_exec($cURL);
    }
   function get_client_ip() {
    $ipaddress = '';
    if (getenv('HTTP_CLIENT_IP'))
        $ipaddress = getenv('HTTP_CLIENT_IP');
    else if(getenv('HTTP_X_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
    else if(getenv('HTTP_X_FORWARDED'))
        $ipaddress = getenv('HTTP_X_FORWARDED');
    else if(getenv('HTTP_FORWARDED_FOR'))
        $ipaddress = getenv('HTTP_FORWARDED_FOR');
    else if(getenv('HTTP_FORWARDED'))
       $ipaddress = getenv('HTTP_FORWARDED');
    else if(getenv('REMOTE_ADDR'))
        $ipaddress = getenv('REMOTE_ADDR');
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
	}
?>