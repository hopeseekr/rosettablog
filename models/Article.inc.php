<?php
/**
* The Article class is responsible for holding the data of articles and making
* sure its properly formatted and validated, among other things.
* It is a Struct datatype, and that is why its properties are public.
*/
class Article
{
    public $id;
    public $title;
    public $created;
    public $lastModified;
    public $teaser;
    public $body;
 
    // 1. Reformat the object.
    public function reformat()
    {
        $this->created = date('Y-m-d h:i:s', $this->created);
        $this->lastModified = date('Y-m-d h:i:s', $this->lastModified);
    }
}

