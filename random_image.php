<?php //一个可以随机返回指定目录中的图片的PHP页面
$image_directory = "./"; //设定图片存储目录的相对路径，默认为当前同目录
$image_type = array(".jpg",".gif",".png"); //设定在目录中要遍历的图片类型
header("location:$image_directory./".image_rand_output($image_directory,$image_type)."");
function image_rand_output($image_directory,$image_type) //随机输出图片
{
    $dh = dir($image_directory);
    while (false !== ($image = $dh -> read()))
    {
        if(in_array(strtolower(strrchr($image,".")),$image_type))
            $image_array[] = $image;
    }
    $dh -> close();
    $key = array_rand($image_array);
    return $image_array[$key];
}
?>
