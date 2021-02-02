if [ $# != 1 ] ; then
echo "USAGE: $0 GreenGrass_Name_Prefix"
echo " e.g.: $0 Test"
exit 1;
fi


echo "Your GG Group Prefix is:$1";

prefix=$1
for line in `cat sn.txt`
do
  gg_core_name=$1'_core_'$line
  gg_group_name=$1'_group_'$line
  gg_dir=$prefix'_'$line
  echo "Your GG Core name: $gg_core_name, GG Group name:$gg_group_name, GG Dir:$gg_dir"
  mkdir $gg_dir && cp cfg.json $gg_dir && cd $gg_dir
  gg_group_setup create-core $gg_core_name cfg.json --region=cn-north-1
  gg_group_setup create mock cfg.json --group_name $gg_group_name --region=cn-north-1
  cd ..
done
