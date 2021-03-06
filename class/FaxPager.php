<?php

// Include the DBPager class
PHPWS_Core::initCoreClass('DBPager.php');

class FaxPager {

    private $pager = NULL;

    public function __construct($type='default'){
        PHPWS_Core::initCoreClass('DBPager.php');
        PHPWS_Core::initModClass('faxmaster', 'Fax.php');

        $this->pager = new DBPager('faxmaster_fax', 'Fax');
        $this->pager->setModule('faxmaster');
        $this->pager->setLink('index.php?module=faxmaster');

        // Don't show hidden faxes
        $this->pager->addWhere('hidden', 0);

        // By default, sort the faxes in reverse chronological order
        $this->pager->setOrder('dateReceived', 'DESC', true);

        if ($type == 'archived') {
            $this->pager->setTemplate('archivePager.tpl');
            $this->pager->setEmptyMessage('No archived faxes found.');
            $this->pager->addRowTags('pagerRowTags', 'archived');
            $this->pager->addWhere('archived', 1);
            $this->pager->setSearch('bannerId', 'firstName', 'lastName', 'whichArchive');
        } else {

            $this->pager->setTemplate('faxPager.tpl');
            $this->pager->setEmptyMessage('No faxes found.');
            $this->pager->addRowTags('pagerRowTags');
            $this->pager->addPageTags(array('UNPRINTED_COUNT' => Fax::getUnprintedCount()));
            $this->pager->addWhere('archived', 0);
            $this->pager->setSearch('bannerId', 'firstName', 'lastName');
        }
    }

    public function show($archive=FALSE) {
        javascript('/jquery/');
        javascript('/jquery_ui/');

        $tpl = array();
        $tpl['PAGER'] = $this->pager->get();


        Layout::add(PHPWS_Template::process($tpl, 'faxmaster', 'faxList.tpl'));
    }
}

?>
