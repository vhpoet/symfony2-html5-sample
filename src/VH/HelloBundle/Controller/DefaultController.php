<?php

namespace VH\HelloBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;


class DefaultController extends Controller
{
    
    public function indexAction()
    {
        return $this->render('VHHelloBundle:Default:index.html.twig', array('name' => 'John'));
    }
}
